import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Materia, MateriaService } from '../../services/materia.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-detalle-materia',
  standalone: false,
  templateUrl: './detalle-materia.component.html',
  styleUrl: './detalle-materia.component.css'
})
export class DetalleMateriaComponent implements OnInit {
  materiaSeleccionada?: Materia;
  clave: string = '';
  mensaje: string = '';
  esError: boolean = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private materiaService: MateriaService
  ) { }

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.materiaService.getMaterias().subscribe({
      next: materias => {
        this.materiaSeleccionada = materias.find(m => m.idMateria === id);
      },
      error: err => console.error('Error al cargar detalle:', err)
    });
  }

  inscripcion(): void {
    if (!this.materiaSeleccionada) return;

    this.materiaService.inscribirse(this.materiaSeleccionada.idMateria, this.clave).subscribe({
      next: (res: any) => {
        this.esError = false;
        this.mensaje = res.mensaje;
        setTimeout(() => {
          this.router.navigate(['/home']);
        }, 1500); // espera 1.5s para mostrar mensaje antes de redirigir
      },
      error: (err) => {
        this.esError = true;
        this.mensaje = err.error?.mensaje || 'Error en la inscripción';
      }
    });
  }
}

