import { Injectable, EventEmitter, Output } from '@angular/core';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  URL = "http://localhost/php";
  @Output()  getLoggedInName: EventEmitter<any> = new EventEmitter();

  constructor( private httpClient: HttpClient) { }


public userlogin( username, password){
alert(username)
return this.httpClient.post<any>(this.URL + '/login.php', { username, password })
.pipe(map(Users => {
this.setToken(Users[0].name);
this.getLoggedInName.emit(true);
return Users;
}));
  }


//token
setToken(token: string) {
  localStorage.setItem('token', token);
  }
// loginUsuario(login){
//     return this.http.post(`${this.URL}/login.php`, JSON.stringify(login));
//   }
 }
