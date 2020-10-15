import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-registrarse',
  templateUrl: './registrarse.component.html',
  styleUrls: ['./registrarse.component.css']
})
export class RegistrarseComponent implements OnInit {
  path = 'inicio';
  constructor(private router: Router) { }

  ngOnInit(): void {
  }
  volver() {
    this.router.navigate(['/iniciars']);
  }

}
