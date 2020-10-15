import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment.prod';
import { HttpClient } from '@angular/common/http';
import { Cliente } from '../clases/clientes';



@Injectable({
  providedIn: 'root'
})
export class ClienteService {
  URL = "http://localhost/php"

  constructor( private httpClient: HttpClient ) { }

  getClientes() {
    return this.httpClient.get(`${this.URL}/getAll.php`);
  }

  getMascota(id: string | number) {
    return this.httpClient.get(`${this.URL}/get.php?idMascota=${id}`);
  }

  addMascota(mascota: Cliente) {
    return this.httpClient.post(`${this.URL}/post.php`, mascota);
  }



}
