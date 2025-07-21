import { Component, Input, OnInit } from '@angular/core';
import { Tema, TemaService } from '../../services/tema.service';
import { Apunte } from '../../services/apunte.service';

@Component({
  selector: 'app-contenido-apunte',
  standalone: false,
  templateUrl: './contenido-apunte.component.html',
  styleUrl: './contenido-apunte.component.css'
})
export class ContenidoApunteComponent implements OnInit{
  @Input() apunte!: Apunte;

  temas: Tema[] = [];
  nuevoTema: string = '';

  editandoId: number | null = null;
  nombreTemporal: string = '';

  constructor(private temaService: TemaService) {}

  ngOnInit(): void {
    this.cargarTemas();
  }

  cargarTemas(): void {
    this.temaService.listarTemas(this.apunte.idApunte).subscribe({
      next: data => this.temas = data,
      error: err => console.error('Error al cargar temas:', err)
    });
  }

  agregarTema(): void {
    const nombre = this.nuevoTema.trim();
    if (!nombre) return;

    this.temaService.insertarTema({ nombre, idApunte: this.apunte.idApunte }).subscribe({
      next: tema => {
        this.temas.push(tema);
        this.nuevoTema = '';
      },
      error: err => console.error('Error al agregar tema:', err)
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
    const confirmacion = confirm('¿Eliminar este tema? Se eliminarán también sus contenidos.');
    if (!confirmacion) return;

    this.temaService.eliminarTema(tema.idTema).subscribe({
      next: () => {
        this.temas = this.temas.filter(t => t.idTema !== tema.idTema);
      },
      error: err => console.error('Error al eliminar tema:', err)
    });
  }
}
