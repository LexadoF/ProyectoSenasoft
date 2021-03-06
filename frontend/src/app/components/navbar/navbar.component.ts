import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit {
  path = 'iniciars';
  path2 = 'registrarse';
  constructor( private httpClient: HttpClient,
               private router: Router ) { }

  ngOnInit(): void {
  }
  iniciarS() {
    this.router.navigate(['/iniciars']);
  }
  registrarse() {
    this.router.navigate(['/registrarse']);
  }

  inicio() {
    this.router.navigate(['/inicio']);
  }
  nosotros() {
    this.router.navigate(['/nosotros']);
  }
  contacto() {
    this.router.navigate(['/contacto']);
  }
  // loginUsuario(login){
  //   return this.http.post(`${this.URL}/Login.php`, JSON.stringify(login));
  // }
}


