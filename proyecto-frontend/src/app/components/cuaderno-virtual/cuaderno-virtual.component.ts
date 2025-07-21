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
    const confirmacion = confirm('¿Estás seguro que deseas eliminar este apunte?\nSe perderá todo su contenido.');
    if (!confirmacion) return;

    this.apunteService.eliminarApunte(apunte.idApunte).subscribe({
      next: () => {
        this.apuntes = this.apuntes.filter(a => a.idApunte !== apunte.idApunte);
        if (this.apunteSeleccionado?.idApunte === apunte.idApunte) {
          this.apunteSeleccionado = this.apuntes[0] || undefined;
        }
      },
      error: (err) => console.error('Error al eliminar apunte:', err)
    });
  }

  seleccionarApunte(apunte: Apunte): void {
    this.apunteSeleccionado = apunte;
  }
}
