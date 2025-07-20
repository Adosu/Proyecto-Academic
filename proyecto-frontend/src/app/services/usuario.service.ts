import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Usuario {
  idUsuario: number;
  nombre: string;
  apellido: string;
  correo: string;
  contrasena?: string;
  estado?: string;
}

@Injectable({
  providedIn: 'root'
})

export class UsuarioService {
  private apiUrl = 'http://localhost:3000/api/usuarios';

  constructor(private http: HttpClient) { }

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }

  // Obtener perfil autenticado
  getPerfil(): Observable<Usuario> {
    return this.http.get<Usuario>(`${this.apiUrl}/perfil`, {
      headers: this.getHeaders()
    });
  }

  // Modificar usuario autenticado
  modificarUsuario(usuario: Usuario): Observable<Usuario> {
    return this.http.put<Usuario>(`${this.apiUrl}/modificar`, usuario, {
      headers: this.getHeaders()
    });
  }

  // Eliminar usuario autenticado
  eliminarUsuario(): Observable<any> {
    return this.http.delete(`${this.apiUrl}/eliminar`, {
      headers: this.getHeaders()
    });
  }
}