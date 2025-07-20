import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Materia {
  idMateria: number;
  nombreMateria: string;
  cursoParalelo: string;
  nombreDocente: string;
  horario: string;
  imagenUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class MateriaService {
  private apiUrl = 'http://localhost:3000/api/materias';

  constructor(private http: HttpClient) { }

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }

  // GET: Lista de materias activas
  getMaterias(): Observable<Materia[]> {
    return this.http.get<Materia[]>(`${this.apiUrl}/listar`, {
      headers: this.getHeaders()
    });
  }

  // POST: Inscripción con clave
  inscribirse(idMateria: number, clave: string) {
    return this.http.post(`${this.apiUrl}/inscribirse`, { idMateria, clave }, {
      headers: this.getHeaders()
    });
  }

  // GET: Lista de materias por usuario
  getMisCursos(): Observable<Materia[]> {
    return this.http.get<Materia[]>(`${this.apiUrl}/mis-cursos`, {
      headers: this.getHeaders()
    });
  }

}
