import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { first } from 'rxjs/operators';
import { FormGroup, FormControl, FormBuilder, Validators, NgForm } from '@angular/forms';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-registrarse',
  templateUrl: './registrarse.component.html',
  styleUrls: ['./registrarse.component.css']
})
export class RegistrarseComponent implements OnInit {
  reForm: FormGroup;
  constructor(private fb: FormBuilder, private dataService: ApiService, private router: Router) {
  this.reForm = this.fb.group({
  email: ['', [Validators.required, Validators.minLength(1), Validators.email]],
  password: ['', Validators.required],
  name: ['', Validators.required]
  });
  }

  ngOnInit() {
  }

  postdata(reForm1)
  {
  this.dataService.userregistration(reForm1.value.name, reForm1.value.email, reForm1.value.password)
  .pipe(first())
  .subscribe(
  data => {
  this.router.navigate(['/iniciars']);
  },

  error => {
    alert("No se Ha podido Registrar")
  });
  }

  get email() { return this.reForm.get('email'); }
  get password() { return this.reForm.get('password'); }
  get name() { return this.reForm.get('name'); }
}
