import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})

export class MateriaService {

  constructor() { 
    console.log("Servicio listo para usar");
  }

  private materias: Materia[] = [
    {
      idMateria: 1,
      nombreMateria: 'Administración de Bases de Datos',
      cursoParalelo: 'Quinto A Diurna',
      nombreDocente: 'Milton Rafael Valarezo Pardo',
      horario: 'Lunes 07:30 - 09:30 y Jueves 07-30 - 09:30',
      estado: 'Activo',
      fechaRegistro: '2025-06-11'
    },
    {
      idMateria: 2,
      nombreMateria: 'Ingeniería de Software I',
      cursoParalelo: 'Quinto A Diruna',
      nombreDocente: 'John Patricio Orellana Preciado',
      horario: 'Lunes 09:30 - 11:30 y Jueves 09-30 - 11:30',
      estado: 'Activo',
      fechaRegistro: '2025-06-11'
    }
  ];

  getMaterias(){
    return this.materias;
  }

  getMateriasId(id: number): Materia | undefined {
    return this.materias.find(r => r.idMateria === id);
  }

  addMaterias(nuevo: Materia): void {
    this.materias.push(nuevo);
  }

  removeMaterias(id: number): void {
    this.materias = this.materias.filter(r => r.idMateria !== id);
  }

}

export interface Materia {
  idMateria: number;
  nombreMateria: string;
  cursoParalelo: string;
  nombreDocente: string;
  horario: string;
  estado: string;
  fechaRegistro: string;
}