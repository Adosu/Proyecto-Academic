import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Contenido {
  idContenido: number;
  idTema: number;
  texto: string;
}

@Injectable({ providedIn: 'root' })
export class ContenidoService {
  private apiUrl = 'http://localhost:3000/api/contenidos';

  constructor(private http: HttpClient) {}

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }

  listarContenidos(idTema: number): Observable<Contenido[]> {
    return this.http.get<Contenido[]>(`${this.apiUrl}/listar?idTema=${idTema}`, {
      headers: this.getHeaders()
    });
  }

  insertarContenido(data: Partial<Contenido>): Observable<Contenido> {
    return this.http.post<Contenido>(`${this.apiUrl}/insertar`, data, {
      headers: this.getHeaders()
    });
  }

  modificarContenido(data: { idContenido: number, texto: string }): Observable<Contenido> {
    return this.http.put<Contenido>(`${this.apiUrl}/modificar`, data, {
      headers: this.getHeaders()
    });
  }

  eliminarContenido(idContenido: number): Observable<any> {
    return this.http.request('delete', `${this.apiUrl}/eliminar`, {
      headers: this.getHeaders(),
      body: { idContenido }
    });
  }
}
