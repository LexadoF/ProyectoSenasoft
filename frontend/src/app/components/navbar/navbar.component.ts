import { HttpClientModule, HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  path = 'iniciars';
  path2 = 'registrarse';
  constructor( private httpClient: HttpClient) { }

  ngOnInit(): void {
  }

  // loginUsuario(login){
  //   return this.http.post(`${this.URL}/Login.php`, JSON.stringify(login));
  // }
}


