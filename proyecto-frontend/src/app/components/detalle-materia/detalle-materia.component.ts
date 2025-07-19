import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Materia, MateriaService } from '../../services/materia.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-detalle-materia',
  standalone: false,
  templateUrl: './detalle-materia.component.html',
  styleUrl: './detalle-materia.component.css'
})
export class DetalleMateriaComponent {

  materiaSeleccionada: Materia | undefined;

  constructor(
    private route: ActivatedRoute,
    private _materiaService: MateriaService,
    private router: Router
  ) { }

  ngOnInit(): void {
    const id = Number(this.route.snapshot.paramMap.get('id'));
    this.materiaSeleccionada = this._materiaService.getMateriasId(id);
  }

  inscripcion(): void {
    // Aquí irá la lógica que tú definas para registrar la materia
    console.log('Inscripción exitosa:', this.materiaSeleccionada);
    this.router.navigate(['/']); // Redirección a home
  }
}

