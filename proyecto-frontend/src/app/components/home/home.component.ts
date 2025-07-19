import { Component } from '@angular/core';
import { Materia, MateriaService } from '../../services/materia.service';

@Component({
  selector: 'app-home',
  standalone: false,
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
  materias: Materia[] = [];

  constructor(private _materiaService: MateriaService) {}

  ngOnInit(): void {
    this.materias = this._materiaService.getMaterias();
  }
}
