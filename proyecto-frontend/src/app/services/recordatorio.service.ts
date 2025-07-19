import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RecordatorioService {
  private apiUrl = 'http://localhost:3000/api/recordatorios/listar';

  constructor(private http: HttpClient) {}

  getRecordatorios(): Observable<Recordatorio[]> {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`
    });

    return this.http.get<Recordatorio[]>(this.apiUrl, { headers });
  }
}

export interface Recordatorio {
  idRecordatorio: number;
  idUsuario: number;
  fechaLimite: string;
  hora: string;
  titulo: string;
  descripcion: string;
  prioridad: string;
  estado: string;
  fechaRegistro: string;
}