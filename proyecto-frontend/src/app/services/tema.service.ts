import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Tema {
  idTema: number;
  idApunte: number;
  idTemaPadre: number | null;
  nombre: string;
}

@Injectable({ providedIn: 'root' })

export class TemaService {
  private apiUrl = 'http://localhost:3000/api/temas';

  constructor(private http: HttpClient) {}

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }

  listarTemas(idApunte: number): Observable<Tema[]> {
    return this.http.get<Tema[]>(`${this.apiUrl}/listar?idApunte=${idApunte}`, {
      headers: this.getHeaders()
    });
  }

  insertarTema(tema: Partial<Tema>): Observable<Tema> {
    return this.http.post<Tema>(`${this.apiUrl}/insertar`, tema, {
      headers: this.getHeaders()
    });
  }

  modificarTema(tema: Tema): Observable<Tema> {
    return this.http.put<Tema>(`${this.apiUrl}/modificar`, tema, {
      headers: this.getHeaders()
    });
  }

  eliminarTema(idTema: number): Observable<any> {
    return this.http.request('delete', `${this.apiUrl}/eliminar`, {
      headers: this.getHeaders(),
      body: { idTema }
    });
  }
}
