
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, NgForm } from '@angular/forms';
import { first } from 'rxjs/operators';
import { Router } from '@angular/router';
import { ApiService } from '../../services/api.service';


@Component({
  selector: 'app-iniciar-s',
  templateUrl: './iniciar-s.component.html',
  styleUrls: ['./iniciar-s.component.css']
})
export class IniciarSComponent {
  inForm: FormGroup;
  constructor(private fb: FormBuilder, private dataService: ApiService, private router: Router) {
  this.inForm = this.fb.group({
  email: ['', [Validators.required, Validators.minLength(1), Validators.email]],
  password: ['', Validators.required]
  });
  }

  ngOnInit() {
  }
  postdata(inForm1)
  {
  this.dataService.userlogin(inForm1.value.email, inForm1.value.password)
  .pipe(first())
  .subscribe(
  data => {
  const redirect = this.dataService.redirectUrl ? this.dataService.redirectUrl : '/principal';
  this.router.navigate([redirect]);
  },
  error => {
  alert("El Usuario O Contraseña Es Incorrecto")
  });
  }
  get email() { return this.inForm.get('email'); }
  get password() { return this.inForm.get('password'); }
}
