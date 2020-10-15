import { Component } from '@angular/core';
import { LoginService } from './services/login.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  login = {
    usuario: null,
    contrasena: null
  };

  constructor( private loginService: LoginService ){


  }
  loginUsuario(){
    this.loginService.loginUsuario(this.login).subscribe (
      datos => {
        if(datos[ "resultado" ] == 'OK'){
          alert(datos['Mensaje']);
        } else {
          alert(datos['Mensaje']);
        }
      }
    );
  }
}
