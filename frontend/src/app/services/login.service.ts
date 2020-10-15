import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  URL = "http://localhost/php"
  constructor( private httpClient: HttpClient ) { }

loginUsuario(login){
    return this.httpClient.post(`${this.URL}/login.php`, JSON.stringify(login));
  }
}
