import { Component, OnInit } from '@angular/core';
import { Materia, MateriaService } from '../../services/materia.service';
import { Usuario, UsuarioService } from '../../services/usuario.service';

@Component({
  selector: 'app-cursos',
  standalone: false,
  templateUrl: './cursos.component.html',
  styleUrl: './cursos.component.css'
})
export class CursosComponent implements OnInit {
  materias: Materia[] = [];
  nombreUsuario: string = '';

  constructor(
    private materiaService: MateriaService,
    private usuarioService: UsuarioService
  ) {}

  ngOnInit(): void {
    // Cargar perfil del usuario
    this.usuarioService.getPerfil().subscribe({
      next: (usuario) => {
        this.nombreUsuario = usuario.nombre + ' ' + usuario.apellido;
      },
      error: (err) => console.error('Error al obtener el perfil:', err)
    });

    // Cargar materias inscritas
    this.materiaService.getMisCursos().subscribe({
      next: (data) => this.materias = data,
      error: (err) => console.error('Error al cargar cursos:', err)
    });
  }

  getImagenFondo(materia: Materia): string {
    return `/img/${materia.imagenUrl || 'vacio.jpg'}`;
  }
}