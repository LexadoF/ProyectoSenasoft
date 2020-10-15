import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { NosotrosComponent } from './components/nosotros/nosotros.component';
import { ContactoComponent } from './components/contacto/contacto.component';
import { InicioComponent } from './components/inicio/inicio.component';

//rutas
import { APP_ROUTING } from './app.routes';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {  } from '../app/services/login.service';
import { LoginService } from './services/login.service';
import { IniciarSComponent } from './components/iniciar-s/iniciar-s.component';
import { RegistrarseComponent } from './components/registrarse/registrarse.component';
import { InventarioComponent } from './components/inventario/inventario.component';
import { FacturaComponent } from './components/factura/factura.component';

import { ClientesComponent } from './components/clientes/clientes.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';






@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    NosotrosComponent,
    ContactoComponent,
    InicioComponent,
    IniciarSComponent,
    RegistrarseComponent,
    InventarioComponent,
    FacturaComponent,
    ClientesComponent,
    LoginComponent,
    RegisterComponent,
    DashboardComponent
  ],
  imports: [
    BrowserModule,
    APP_ROUTING,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [
    LoginService
  ],

  bootstrap: [AppComponent]
})
export class AppModule { }
