import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Apunte {
  idApunte: number;
  idUsuMat: number;
  titulo: string;
  resumen: string;
  fecha: string;
}

@Injectable({ providedIn: 'root' })

export class ApunteService {
  private apiUrl = 'http://localhost:3000/api/apuntes';

  constructor(private http: HttpClient) {}

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders().set('Authorization', `Bearer ${token}`);
  }

  listarApuntes(idMateria: number): Observable<Apunte[]> {
    return this.http.get<Apunte[]>(`${this.apiUrl}/listar/${idMateria}`, {
      headers: this.getHeaders()
    });
  }

  insertarApunte(apunte: Partial<Apunte>, idMateria: number): Observable<Apunte> {
    return this.http.post<Apunte>(`${this.apiUrl}/insertar/${idMateria}`, apunte, {
      headers: this.getHeaders()
    });
  }

  modificarApunte(apunte: Apunte): Observable<Apunte> {
    return this.http.put<Apunte>(`${this.apiUrl}/modificar`, apunte, {
      headers: this.getHeaders()
    });
  }

  eliminarApunte(idApunte: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/eliminar`, {
      headers: this.getHeaders(),
      body: { idApunte }
    });
  }
}
