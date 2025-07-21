import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RecordatorioService {
  private baseUrl = 'http://localhost:3000/api/recordatorios';

  constructor(private http: HttpClient) {}

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }

  getRecordatorios(): Observable<Recordatorio[]> {
    return this.http.get<Recordatorio[]>(`${this.baseUrl}/listar`, { headers: this.getHeaders() });
  }

  insertarRecordatorio(data: any): Observable<any> {
    return this.http.post(`${this.baseUrl}/insertar`, data, { headers: this.getHeaders() });
  }

  modificarRecordatorio(data: any): Observable<any> {
    return this.http.put(`${this.baseUrl}/modificar`, data, { headers: this.getHeaders() });
  }

  eliminarRecordatorio(id: number): Observable<any> {
    return this.http.request('delete', `${this.baseUrl}/eliminar`, {
      headers: this.getHeaders(),
      body: { idRecordatorio: id }
    });
  }
}

export interface Recordatorio {
  idRecordatorio: number;
  idUsuario: number;
  fechaLimite: string;
  hora: string;
  titulo: string;
  descripcion: string;
  estado: string;
  fechaRegistro: string;
}