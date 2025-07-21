import { Component, Input, OnInit } from '@angular/core';
import { Contenido, ContenidoService } from '../../services/contenido.service';
import { Tema } from '../../services/tema.service';

@Component({
  selector: 'app-contenido-tema',
  standalone: false,
  templateUrl: './contenido-tema.component.html',
  styleUrl: './contenido-tema.component.css'
})
export class ContenidoTemaComponent implements OnInit{
  @Input() tema!: Tema;
  contenidos: Contenido[] = [];
  nuevoContenido: string = '';

  editandoId: number | null = null;
  textoTemporal: string = '';

  constructor(private contenidoService: ContenidoService) {}

  ngOnInit(): void {
    if (this.tema?.idTema) {
      this.cargarContenidos();
    }
  }

  cargarContenidos(): void {
    this.contenidoService.listarContenidos(this.tema.idTema).subscribe({
      next: (data) => this.contenidos = data,
      error: (err) => console.error('Error al cargar contenidos:', err)
    });
  }

  agregarContenido(): void {
    const texto = this.nuevoContenido.trim();
    if (!texto) return;

    const nuevo: Partial<Contenido> = {
      idTema: this.tema.idTema,
      idTipo: 1,
      texto
    };

    this.contenidoService.insertarContenido(nuevo).subscribe({
      next: (contenido) => {
        this.contenidos.push(contenido);
        this.nuevoContenido = '';
      },
      error: (err) => console.error('Error al insertar contenido:', err)
    });
  }

  eliminarContenido(idContenido: number): void {
    const confirmar = confirm('¿Eliminar este contenido?');
    if (!confirmar) return;

    this.contenidoService.eliminarContenido(idContenido).subscribe({
      next: () => {
        this.contenidos = this.contenidos.filter(c => c.idContenido !== idContenido);
      },
      error: (err) => console.error('Error al eliminar contenido:', err)
    });
  }

  habilitarEdicion(c: Contenido): void {
    this.editandoId = c.idContenido;
    this.textoTemporal = c.texto;
  }

  guardarEdicion(c: Contenido): void {
    const texto = this.textoTemporal.trim();
    if (!texto) return;

    const actualizado = { ...c, texto };

    this.contenidoService.modificarContenido(actualizado).subscribe({
      next: () => {
        c.texto = texto;
        this.editandoId = null;
      },
      error: (err) => console.error('Error al modificar contenido:', err)
    });
  }

  cancelarEdicion(): void {
    this.editandoId = null;
  }
}
