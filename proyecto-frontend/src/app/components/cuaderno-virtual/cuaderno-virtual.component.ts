import { Component, OnInit } from '@angular/core';
import { Apunte, ApunteService } from '../../services/apunte.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-cuaderno-virtual',
  standalone: false,
  templateUrl: './cuaderno-virtual.component.html',
  styleUrl: './cuaderno-virtual.component.css'
})

export class CuadernoVirtualComponent implements OnInit {
  idMateria!: number;
  apuntes: Apunte[] = [];
  apunteSeleccionado?: Apunte;
  modalVisible: boolean = false;
  modalTitulo: string = '';
  modalMensaje: string = '';
  apuntePendiente?: Apunte;

  mostrarFormulario: boolean = false;
  nuevoTitulo: string = '';
  nuevoResumen: string = '';

  modoEdicion: boolean = false;
  apunteEditando?: Apunte;

  constructor(
    private apunteService: ApunteService,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.idMateria = Number(this.route.snapshot.paramMap.get('id'));
    this.cargarApuntes();
  }

  cargarApuntes(): void {
    this.apunteService.listarApuntes(this.idMateria).subscribe({
      next: (data) => {
        this.apuntes = data;
        if (data.length > 0) {
          this.seleccionarApunte(data[0]);
        }
      },
      error: (err) => console.error('Error al listar apuntes:', err)
    });
  }

  toggleFormulario(): void {
    this.mostrarFormulario = !this.mostrarFormulario;
    if (!this.mostrarFormulario) {
      this.resetFormulario();
    }
  }

  crearApunte(): void {
    if (!this.nuevoTitulo.trim()) return;

    const nuevo: Partial<Apunte> = {
      titulo: this.nuevoTitulo.trim(),
      resumen: this.nuevoResumen.trim()
    };

    this.apunteService.insertarApunte(nuevo, this.idMateria).subscribe({
      next: (apunte) => {
        this.apuntes.unshift(apunte);
        this.seleccionarApunte(apunte);
        this.toggleFormulario();
      },
      error: (err) => console.error('Error al crear apunte:', err)
    });
  }

  editarApunte(apunte: Apunte): void {
    this.modoEdicion = true;
    this.apunteEditando = apunte;
    this.nuevoTitulo = apunte.titulo;
    this.nuevoResumen = apunte.resumen || '';
    this.mostrarFormulario = true;
  }

  guardarCambios(): void {
    if (!this.apunteEditando || !this.nuevoTitulo.trim()) return;

    const actualizado: Apunte = {
      ...this.apunteEditando,
      titulo: this.nuevoTitulo.trim(),
      resumen: this.nuevoResumen.trim()
    };

    this.apunteService.modificarApunte(actualizado).subscribe({
      next: () => {
        const index = this.apuntes.findIndex(a => a.idApunte === actualizado.idApunte);
        if (index !== -1) {
          this.apuntes[index] = actualizado;
          this.seleccionarApunte(actualizado);
        }
        this.toggleFormulario();
        this.resetFormulario();
      },
      error: (err) => console.error('Error al modificar apunte:', err)
    });
  }

  resetFormulario(): void {
    this.nuevoTitulo = '';
    this.nuevoResumen = '';
    this.apunteEditando = undefined;
    this.modoEdicion = false;
  }

  confirmarEliminar(apunte: Apunte): void {
    this.apuntePendiente = apunte;
    this.modalTitulo = 'Confirmar eliminación';
    this.modalMensaje = '¿Estás seguro que deseas eliminar este apunte? Se eliminará todo el contenido que contiene.';
    this.modalVisible = true;
  }

  eliminarConfirmado(): void {
    if (!this.apuntePendiente) return;

    this.apunteService.eliminarApunte(this.apuntePendiente.idApunte).subscribe({
      next: () => {
        this.apuntes = this.apuntes.filter(a => a.idApunte !== this.apuntePendiente?.idApunte);
        if (this.apunteSeleccionado?.idApunte === this.apuntePendiente?.idApunte) {
          this.apunteSeleccionado = this.apuntes[0] || undefined;
        }
        this.modalVisible = false;
        this.apuntePendiente = undefined;
      },
      error: (err) => console.error('Error al eliminar apunte:', err)
    });
  }

  cancelarEliminacion(): void {
    this.modalVisible = false;
    this.apuntePendiente = undefined;
  }

  seleccionarApunte(apunte: Apunte): void {
    this.apunteSeleccionado = apunte;
  }
}
