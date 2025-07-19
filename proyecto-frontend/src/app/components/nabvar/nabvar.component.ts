import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-nabvar',
  standalone: false,
  templateUrl: './nabvar.component.html',
  styleUrls: ['./nabvar.component.css']
})
export class NabvarComponent {
  constructor(private router: Router) { }

  logout() {
    localStorage.removeItem('token');
    this.router.navigate(['/login']);
  }
}
