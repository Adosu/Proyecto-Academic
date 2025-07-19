import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  standalone: false,
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'proyecto';

  estaAutenticado(): boolean {
    return typeof window !== 'undefined' && !!localStorage.getItem('token');
  }
}
