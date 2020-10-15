export class Cliente {
  constructor(
      public documento: string,
      public nombre: string,
      public telefono: number,
      public direccion: string,
      public id?: number
  ) { }

}
