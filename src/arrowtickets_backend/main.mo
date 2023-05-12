// Inicio importando libreria que se requiere
import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Time "mo:base/Time";

// Clase Principal
actor tickets {
  
  // Defino Variables
  type Nombre = Text;
  type Goodie = Text;
 
 //Defino Objetos

  type Entry = {
    fecha : Text;
    lugar : Text;
    precio : Nat;
  };

  type EntryRegalo = {
    nombre : Text;
    tipo : Text;
    cantidad : Nat;
  };

// Crear Variables ticketrecord y regalorecord que son hashmap asociando nombre del evento o regalo con el objeto entry o entryregalo
let ticketRecord = Map.HashMap<Nombre, Entry>(0, Text.equal, Text.hash);
let regaloRecord = Map.HashMap<Goodie, EntryRegalo>(0, Text.equal, Text.hash);

// Crear Funcion para Guardar el nombre del evento con una entrada con la fecha, el lugar y el precio
public func guardar(name : Nombre, entry : Entry): async Text {
    ticketRecord.put(name, entry);
    return "Se ha creado un nuevo evento";
  };

// Crear Funcion para Guardar el Goodie del evento con las caracteristicas de ese regalo, haciendo entrada de texto y objeto
public func guardarGoodie(name : Goodie, entry : EntryRegalo): async Text {
    regaloRecord.put(name, entry);
    return "Se ha creado un regalo para el evento";
  };

// Funciones para traer el hashmap Evento parametro nombre, asincrono de la entrada, para traer el evento
public query func getEvento(name : Nombre) : async ?Entry {
    ticketRecord.get(name);
  };

 // Funciones para traer el hashmap goodie 

  public query func getRegalo(name : Goodie) : async ?EntryRegalo {
    regaloRecord.get(name);
  };

// Funcion para comprar haciendo una validacion donde no se puede adquirir mas de 5 nft
public func comprar (cantidad: Nat) : async Text {

    if (cantidad > 5) {
      return "No puede comprar una cantidad mayor a 5 NFT";
    };

       return "Compra exitosa"
};

};



