import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api/auth/login'; // Ajusta si usas dominio

  constructor(private http: HttpClient) { }

  login(correo: string, contraseña: string): Observable<any> {
    return this.http.post(this.apiUrl, { correo, contraseña });
  }

  logout() {
    localStorage.removeItem('token');
  }

  getToken(): string | null {
    return localStorage.getItem('token');
  }
}
