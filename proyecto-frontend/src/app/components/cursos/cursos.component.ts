import { Component, OnInit, ElementRef, HostListener, ViewChildren, QueryList } from '@angular/core';
import { Materia, MateriaService } from '../../services/materia.service';
import { UsuarioService } from '../../services/usuario.service';
import { UsuarioMateriaService } from '../../services/usuario-materia.service';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-cursos',
  standalone: false,
  templateUrl: './cursos.component.html',
  styleUrl: './cursos.component.css'
})
export class CursosComponent implements OnInit {
  materias: Materia[] = [];
  nombreUsuario: string = '';
  menuAbierto: number | null = null;

  @ViewChildren('dropdownMenu') dropdownMenus!: QueryList<ElementRef>;

  constructor(
    private materiaService: MateriaService,
    private usuarioService: UsuarioService,
    private usuarioMateriaService: UsuarioMateriaService,
    private snackBar: MatSnackBar
  ) { }

  ngOnInit(): void {
    // Cargar perfil del usuario
    this.usuarioService.getPerfil().subscribe({
      next: (usuario) => {
        this.nombreUsuario = usuario.nombre + ' ' + usuario.apellido;
      },
      error: (err) => console.error('Error al obtener el perfil:', err)
    });

    // Cargar materias inscritas
    this.cargarMaterias();
  }

  cargarMaterias() {
    this.materiaService.getMisCursos().subscribe({
      next: (data) => this.materias = data,
      error: (err) => console.error('Error al cargar cursos:', err)
    });
  }

  getImagenFondo(materia: Materia): string {
    return `/img/${materia.imagenUrl || 'vacio.jpg'}`;
  }

  toggleMenu(idMateria: number) {
    this.menuAbierto = this.menuAbierto === idMateria ? null : idMateria;
  }

  desinscribirse(materia: Materia) {
    this.usuarioMateriaService.desinscribirse(materia.idMateria).subscribe({
      next: () => {
        this.snackBar.open(`Te has desinscrito de ${materia.nombreMateria}`, 'Cerrar', {
          duration: 3000
        });
        this.cargarMaterias(); // recargar la lista
      },
      error: (err) => {
        console.error('Error al desinscribirse:', err);
        this.snackBar.open('Ocurrió un error al desinscribirse', 'Cerrar', {
          duration: 3000
        });
      }
    });
    this.menuAbierto = null;
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    const clickedInsideAnyMenu = this.dropdownMenus.some(
      (menu) => menu.nativeElement.contains(event.target)
    );
    if (!clickedInsideAnyMenu) {
      this.menuAbierto = null;
    }
  }

}