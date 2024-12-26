import Map "mo:base/HashMap";
import Text "mo:base/Text";

actor {

    type Name = Text;
    type Phone = Text;

     // C deki struct  yapısı gibi:  Entry (text, phone)
    type Entry = { 
      desc: Text;
      phone: Phone;
    };
    // C deki struct  yapısı gibi:  Message (receiver, mess)
    type Message = {
      receiver: Text;
      mess: Text;
    };

    // hash map tanınlanmış
    let phoneBook = Map.HashMap<Name, Entry>(0, Text.equal, Text.hash);
    
    let MessageHistory = Map.HashMap<Phone, Message>(0, Text.equal, Text.hash);

    // phone a kisi ekle fonksiyonu
    public func insert(name: Name, entry: Entry): async() {
      phoneBook.put(name, entry);
    };

    // phone dan isim arayınca getir 
    public query func getPhone(name: Name): async ?Entry {
      phoneBook.get(name)
    };
     // phone dan  mesaj gönder fonksiyonu
    public func sendMessage(senderPhone: Phone,message: Message): async (){
      MessageHistory.put(senderPhone, message);
    };

    public query func getMessages(senderPhone: Phone): async ?Message {
      MessageHistory.get(senderPhone)
    };


};
