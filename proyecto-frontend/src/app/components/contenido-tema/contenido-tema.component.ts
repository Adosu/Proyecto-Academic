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

  nuevoTexto: string = '';
  editandoId: number | null = null;
  textoTemporal: string = '';

  constructor(private contenidoService: ContenidoService) {}

  ngOnInit(): void {
    this.cargarContenidos();
  }

  cargarContenidos(): void {
    this.contenidoService.listarContenidos(this.tema.idTema).subscribe({
      next: data => this.contenidos = data,
      error: err => console.error('Error al listar contenidos:', err)
    });
  }

  insertarContenido(): void {
    const texto = this.nuevoTexto.trim();
    if (!texto) return;

    const nuevo: Partial<Contenido> = {
      idTema: this.tema.idTema,
      idTipo: 1, // Por defecto tipo 1
      texto
    };

    this.contenidoService.insertarContenido(nuevo).subscribe({
      next: (res) => {
        this.contenidos.push(res);
        this.nuevoTexto = '';
      },
      error: err => console.error('Error al insertar contenido:', err)
    });
  }

  habilitarEdicion(c: Contenido): void {
    this.editandoId = c.idContenido;
    this.textoTemporal = c.texto;
  }

  guardarEdicion(c: Contenido): void {
    const nuevo = this.textoTemporal.trim();
    if (!nuevo) return;

    this.contenidoService.modificarContenido({ ...c, texto: nuevo }).subscribe({
      next: (modificado) => {
        c.texto = modificado.texto;
        this.cancelarEdicion();
      },
      error: err => console.error('Error al modificar contenido:', err)
    });
  }

  cancelarEdicion(): void {
    this.editandoId = null;
    this.textoTemporal = '';
  }

  eliminarContenido(idContenido: number): void {
    if (!confirm('¿Seguro que deseas eliminar este contenido?')) return;

    this.contenidoService.eliminarContenido(idContenido).subscribe({
      next: () => {
        this.contenidos = this.contenidos.filter(c => c.idContenido !== idContenido);
      },
      error: err => console.error('Error al eliminar contenido:', err)
    });
  }
}
