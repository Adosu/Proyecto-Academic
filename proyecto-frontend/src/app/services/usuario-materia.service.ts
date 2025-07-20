import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsuarioMateriaService {
  private apiUrl = 'http://localhost:3000/api/usuarioMaterias';

  constructor(private http: HttpClient) { }

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`,
      'Content-Type': 'application/json'
    });
  }

  // Desinscribirse del curso
  desinscribirse(idMateria: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/desinscribir`, {
      headers: this.getHeaders(),
      body: { idMateria }
    });
  }
}
