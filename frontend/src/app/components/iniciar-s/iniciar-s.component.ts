import { Component, OnInit } from '@angular/core';
import { LoginService } from '../../services/login.service';

@Component({
  selector: 'app-iniciar-s',
  templateUrl: './iniciar-s.component.html',
  styleUrls: ['./iniciar-s.component.css']
})
export class IniciarSComponent {
  login = {
    usuario: null,
    contrasena: null
  };
  path = 'inicio';

  constructor( private loginService: LoginService ){}

  ngOnInit(): void {
  }

  loginUsuario(){
    this.loginService.loginUsuario(this.login).subscribe (
      datos => {
        if(datos[ "resultado" ] === 'OK'){
          alert(datos['Mensaje']);
        } else {
          alert(datos['Mensaje']);
        }
      }
    );
  }
}
