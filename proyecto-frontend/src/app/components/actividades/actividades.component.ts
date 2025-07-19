import { Component, OnInit } from '@angular/core';
import { Recordatorio, RecordatorioService } from '../../services/recordatorio.service';

@Component({
  selector: 'app-actividades',
  standalone: false,
  templateUrl: './actividades.component.html',
  styleUrl: './actividades.component.css'
})
export class ActividadesComponent implements OnInit {
  recordatoriosAgrupados: { [fecha: string]: Recordatorio[] } = {};
  filtroSeleccionado: string = '30';

  constructor(private recordatorioService: RecordatorioService) { }

  ngOnInit(): void {
    this.cargarRecordatorios();
  }

  aplicarFiltro(): void {
    this.cargarRecordatorios(); // Reaplica el filtro al cambiar
  }

  cargarRecordatorios(): void {
    const hoy = new Date();
    hoy.setHours(0, 0, 0, 0);

    this.recordatorioService.getRecordatorios().subscribe(recordatorios => {
      if (this.filtroSeleccionado === '7') {
        const fechaLimite = new Date(hoy);
        fechaLimite.setDate(hoy.getDate() + 7);
        recordatorios = recordatorios.filter(r => {
          const fecha = new Date(r.fechaLimite);
          return fecha >= hoy && fecha <= fechaLimite;
        });
      } else if (this.filtroSeleccionado === '30') {
        const fechaLimite = new Date(hoy);
        fechaLimite.setDate(hoy.getDate() + 30);
        recordatorios = recordatorios.filter(r => {
          const fecha = new Date(r.fechaLimite);
          return fecha >= hoy && fecha <= fechaLimite;
        });
      } else if (this.filtroSeleccionado === 'atrasadas') {
        recordatorios = recordatorios.filter(r => {
          const fecha = new Date(r.fechaLimite);
          return fecha < hoy;
        });
      }

      this.recordatoriosAgrupados = this.agruparPorFecha(recordatorios);
    });
  }

  private agruparPorFecha(recordatorios: Recordatorio[]): { [fecha: string]: Recordatorio[] } {
    return recordatorios.reduce((acc, r) => {
      const fecha = r.fechaLimite;
      acc[fecha] = acc[fecha] || [];
      acc[fecha].push(r);
      return acc;
    }, {} as { [fecha: string]: Recordatorio[] });
  }

  get fechasOrdenadas(): string[] {
    return Object.keys(this.recordatoriosAgrupados).sort((a, b) => {
      return new Date(a).getTime() - new Date(b).getTime();
    });
  }
}