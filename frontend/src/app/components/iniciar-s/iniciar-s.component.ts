import { Component, OnInit } from '@angular/core';
import { LoginService } from '../../services/login.service';
import { Router } from '@angular/router';

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
  path2 = 'registrarse';

  constructor( private loginService: LoginService,
               private router: Router ){}

  ngOnInit(): void {
  }

  volver() {
    this.router.navigate(['/registrarse']);
  }

  loginUsuario(){
    this.loginService.loginUsuario(this.login).subscribe (
      datos => {
        if (datos[ 'resultado' ] === 'OK'){
          alert(datos['Mensaje']);
        } else {
          alert(datos['Mensaje']);
        }
      }
    );
  }
}
