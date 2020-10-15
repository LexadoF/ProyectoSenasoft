import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import {ApiService} from '../../services/api.service';

@Component({
  selector: 'app-nav2',
  templateUrl: './nav2.component.html',
  styleUrls: ['./nav2.component.css']
})
export class Nav2Component implements OnInit {

  // loginbtn: boolean;
  logoutbtn: boolean;

  // path = 'iniciars';
  // path2 = 'registrarse';
  constructor( private dataService: ApiService, private router: Router ) {
    dataService.getLoggedInName.subscribe(name => this.changeName(name));
    if(this.dataService.isLoggedIn())
    {
    console.log( "loggedin" );
    // this.loginbtn = false;
    this.logoutbtn = true;
    }
    else{
    // this.loginbtn = true;
    this.logoutbtn = false;
    }
   }

  ngOnInit(): void {
  }

  private changeName(name: boolean): void {
    this.logoutbtn = name;
    // this.loginbtn = !name;
    }

    contacto() {
      this.router.navigate(['/contacto']);
    }
    inventario() {
      this.router.navigate(['/inventario']);
    }
    cliente() {
      this.router.navigate(['/cliente']);
    }
    nosotros() {
      this.router.navigate(['/nosotros']);
    }
    inicio() {
      this.router.navigate(['/inicio']);
    }
    factura() {
      this.router.navigate(['/factura']);
    }

  logout()
  {
  this.dataService.deleteToken();
  window.location.href = window.location.href;
  }
}

