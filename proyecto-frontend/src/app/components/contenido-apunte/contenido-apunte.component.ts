import { Component, Input, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { Tema, TemaService } from '../../services/tema.service';
import { Apunte } from '../../services/apunte.service';

@Component({
  selector: 'app-contenido-apunte',
  standalone: false,
  templateUrl: './contenido-apunte.component.html',
  styleUrl: './contenido-apunte.component.css'
})
export class ContenidoApunteComponent implements OnInit, OnChanges {
  @Input() apunte!: Apunte;

  temas: Tema[] = [];
  nuevoTema: string = '';

  editandoId: number | null = null;
  nombreTemporal: string = '';

  constructor(private temaService: TemaService) { }

  ngOnInit(): void {
    this.cargarTemas();
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['apunte'] && !changes['apunte'].firstChange) {
      this.cargarTemas(); // ✅ vuelve a cargar los temas del nuevo apunte
    }
  }

  cargarTemas(): void {
    this.temaService.listarTemas(this.apunte.idApunte).subscribe({
      next: data => {
        this.temas = data;
      },
      error: err => console.error('Error al cargar temas:', err)
    });
  }

  get temasPadre(): Tema[] {
    return this.temas.filter(t => t.idTemaPadre == null);
  }

  obtenerSubtemas(padre: Tema): Tema[] {
    return this.temas.filter(t => Number(t.idTemaPadre) === padre.idTema);
  }

  agregarTema(): void {
    const nombre = this.nuevoTema.trim();
    if (!nombre) return;

    const nuevo: Partial<Tema> = {
      nombre,
      idApunte: this.apunte.idApunte,
      idTemaPadre: null
    };

    this.temaService.insertarTema(nuevo).subscribe({
      next: tema => {
        this.temas.push(tema);
        this.nuevoTema = '';
      },
      error: err => console.error('Error al agregar tema:', err)
    });
  }

  agregarSubtema(padre: Tema): void {
    const nombre = prompt('Nombre del subtema:')?.trim();
    if (!nombre) return;

    const nuevo: Partial<Tema> = {
      nombre,
      idApunte: this.apunte.idApunte,
      idTemaPadre: padre.idTema
    };

    this.temaService.insertarTema(nuevo).subscribe({
      next: () => this.cargarTemas(),
      error: err => console.error('Error al agregar subtema:', err)
    });
  }

  habilitarEdicion(tema: Tema): void {
    this.editandoId = tema.idTema;
    this.nombreTemporal = tema.nombre;
  }

  guardarEdicion(tema: Tema): void {
    const nuevoNombre = this.nombreTemporal.trim();
    if (!nuevoNombre) return;

    const actualizado = { ...tema, nombre: nuevoNombre };

    this.temaService.modificarTema(actualizado).subscribe({
      next: () => {
        tema.nombre = nuevoNombre;
        this.editandoId = null;
      },
      error: err => console.error('Error al actualizar tema:', err)
    });
  }

  cancelarEdicion(): void {
    this.editandoId = null;
  }

  eliminarTema(tema: Tema): void {
    const confirmar = confirm('¿Estás seguro de eliminar este tema? También se eliminarán sus contenidos y subtemas.');
    if (!confirmar) return;

    this.temaService.eliminarTema(tema.idTema).subscribe({
      next: () => {
        this.temas = this.temas.filter(
          t => t.idTema !== tema.idTema && t.idTemaPadre !== tema.idTema
        );
      },
      error: err => console.error('Error al eliminar tema:', err)
    });
  }
}
