import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Time "mo:base/Time";


actor tickets {

  type Nombre = Text;
  type Goodie = Text;
 
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

let ticketRecord = Map.HashMap<Nombre, Entry>(0, Text.equal, Text.hash);
let regaloRecord = Map.HashMap<Goodie, EntryRegalo>(0, Text.equal, Text.hash);


public func guardar(name : Nombre, entry : Entry): async Text {
    ticketRecord.put(name, entry);
    return "Se ha creado un nuevo evento";
  };

public func guardarGoodie(name : Goodie, entry : EntryRegalo): async Text {
    regaloRecord.put(name, entry);
    return "Se ha creado un regalo para el evento";
  };

public query func getEvento(name : Nombre) : async ?Entry {
    ticketRecord.get(name);
  };

  public query func getRegalo(name : Goodie) : async ?EntryRegalo {
    regaloRecord.get(name);
  };

public func comprar (cantidad: Nat) : async Text {

        if (cantidad > 5) {
      return "No puede comprar una cantidad mayor a 5 NFT";
    };

       return "Compra exitosa"
};

};



