import { RouterModule, Routes } from '@angular/router';
import { InicioComponent } from './components/inicio/inicio.component';
import { NosotrosComponent } from './components/nosotros/nosotros.component';
import { ContactoComponent } from './components/contacto/contacto.component';
import { IniciarSComponent } from './components/iniciar-s/iniciar-s.component';
import { RegistrarseComponent } from './components/registrarse/registrarse.component';
import { InventarioComponent } from './components/inventario/inventario.component';
import { FacturaComponent } from './components/factura/factura.component';
import { ClientesComponent } from './components/clientes/clientes.component';
import { PrincipalComponent } from './components/principal/principal.component';



const APP_ROUTES: Routes = [
  {path: 'inicio', component: InicioComponent},
  {path: 'nosotros', component: NosotrosComponent },
  {path: 'contacto', component: ContactoComponent },
  {path: 'iniciars', component: IniciarSComponent },
  {path: 'registrarse', component: RegistrarseComponent },
  {path: 'inventario', component: InventarioComponent },
  {path: 'factura', component: FacturaComponent },
  {path: 'cliente', component: ClientesComponent },
  {path: 'principal', component: PrincipalComponent },
  {path: '**', pathMatch: 'full', redirectTo: 'inicio'}
];

export const APP_ROUTING = RouterModule.forRoot(APP_ROUTES);
