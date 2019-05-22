DROP TABLE customers CASCADE CONSTRAINTS
/
DROP TABLE accounts CASCADE CONSTRAINTS
/
DROP TABLE transactions CASCADE CONSTRAINTS
/
DROP TABLE transactions_history CASCADE CONSTRAINTS
/
DROP TABLE credit_cards CASCADE CONSTRAINTS
/
DROP TABLE packs CASCADE CONSTRAINTS
/
DROP TABLE customer_credit_cards CASCADE CONSTRAINTS
/
DROP TABLE options CASCADE CONSTRAINTS
/

CREATE TABLE customers (
  id INT NOT NULL PRIMARY KEY,
  nume VARCHAR2(15) NOT NULL,
  prenume VARCHAR2(30) NOT NULL,
  created_at DATE,
  updated_at DATE
)
/

CREATE TABLE accounts (
  account_number VARCHAR2(24) NOT NULL PRIMARY KEY,
  balance DOUBLE PRECISION,
  created_at DATE,
  updated_at DATE
)
/

CREATE TABLE transactions (
  id INT NOT NULL PRIMARY KEY,
  acc_no_customer1 VARCHAR(24) NOT NULL,
  acc_no_customer2 VARCHAR(24) NOT NULL,
  CONSTRAINT fk_trans_acc_no_cus1 FOREIGN KEY (acc_no_customer1) REFERENCES accounts(account_number),
  CONSTRAINT fk_trans_acc_no_cus2 FOREIGN KEY (acc_no_customer2) REFERENCES accounts(account_number)
)
/

CREATE TABLE transactions_history (
  id_transaction INT NOT NULL PRIMARY KEY,
  --id_transaction INT NOT NULL,
  amount INT,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_trans_history_id_trans FOREIGN KEY (id_transaction) REFERENCES transactions(id)
)
/


CREATE TABLE credit_cards (
  card_number VARCHAR2(16) NOT NULL PRIMARY KEY,
  expire_date DATE,
  cvv VARCHAR2(3),
  created_at DATE,
  updated_at DATE
)
/

CREATE TABLE customer_credit_cards (
  id INT NOT NULL PRIMARY KEY,
  id_customer INT NOT NULL,
  card_number VARCHAR2(16) NOT NULL,
  account_number VARCHAR2(24) NOT NULL,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_cust_cred_cards_id_cust FOREIGN KEY (id_customer) REFERENCES customers(id),
  CONSTRAINT fk_cust_cred_cards_card_num FOREIGN KEY (card_number) REFERENCES credit_cards(card_number),
  CONSTRAINT fk_cust_cred_cards_acc_num FOREIGN KEY (account_number) REFERENCES accounts(account_number)
)
/

CREATE TABLE packs (
  id INT NOT NULL PRIMARY KEY,
  type VARCHAR2(15),
  cost INT,
  created_at DATE,
  updated_at DATE
)
/




CREATE TABLE options (
  id INT NOT NULL PRIMARY KEY,
  account_number VARCHAR2(24) NOT NULL,
  id_package INT NOT NULL,
  created_at DATE,
  updated_at DATE,
  CONSTRAINT fk_options_account_number FOREIGN KEY (account_number) REFERENCES accounts(account_number),
  CONSTRAINT fk_options_id_package FOREIGN KEY (id_package) REFERENCES packs(id)
)
/


SET SERVEROUTPUT ON;

DECLARE
  TYPE varr IS VARRAY(1000) OF varchar2(255);
  TYPE prefix_varr IS VARRAY(10) OF varchar2(4);
  lista_nume varr := varr('Ababei','Acasandrei','Adascalitei','Afanasie','Agafitei','Agape','Aioanei','Alexandrescu','Alexandru','Alexe','Alexii','Amarghioalei','Ambroci','Andonesei','Andrei','Andrian','Andrici','Andronic','Andros','Anghelina','Anita','Antochi','Antonie','Apetrei','Apostol','Arhip','Arhire','Arteni','Arvinte','Asaftei','Asofiei','Aungurenci','Avadanei','Avram','Babei','Baciu','Baetu','Balan','Balica','Banu','Barbieru','Barzu','Bazgan','Bejan','Bejenaru','Belcescu','Belciuganu','Benchea','Bilan','Birsanu','Bivol','Bizu','Boca','Bodnar','Boistean','Borcan','Bordeianu','Botezatu','Bradea','Braescu','Budaca','Bulai','Bulbuc-aioanei','Burlacu','Burloiu','Bursuc','Butacu','Bute','Buza','Calancea','Calinescu','Capusneanu','Caraiman','Carbune','Carp','Catana','Catiru','Catonoiu','Cazacu','Cazamir','Cebere','Cehan','Cernescu','Chelaru','Chelmu','Chelmus','Chibici','Chicos','Chilaboc','Chile','Chiriac','Chirila','Chistol','Chitic','Chmilevski','Cimpoesu','Ciobanu','Ciobotaru','Ciocoiu','Ciofu','Ciornei','Citea','Ciucanu','Clatinici','Clim','Cobuz','Coca','Cojocariu','Cojocaru','Condurache','Corciu','Corduneanu','Corfu','Corneanu','Corodescu','Coseru','Cosnita','Costan','Covatariu','Cozma','Cozmiuc','Craciunas','Crainiceanu','Creanga','Cretu','Cristea','Crucerescu','Cumpata','Curca','Cusmuliuc','Damian','Damoc','Daneliuc','Daniel','Danila','Darie','Dascalescu','Dascalu','Diaconu','Dima','Dimache','Dinu','Dobos','Dochitei','Dochitoiu','Dodan','Dogaru','Domnaru','Dorneanu','Dragan','Dragoman','Dragomir','Dragomirescu','Duceac','Dudau','Durnea','Edu','Eduard','Eusebiu','Fedeles','Ferestraoaru','Filibiu','Filimon','Filip','Florescu','Folvaiter','Frumosu','Frunza','Galatanu','Gavrilita','Gavriliuc','Gavrilovici','Gherase','Gherca','Ghergu','Gherman','Ghibirdic','Giosanu','Gitlan','Giurgila','Glodeanu','Goldan','Gorgan','Grama','Grigore','Grigoriu','Grosu','Grozavu','Gurau','Haba','Harabula','Hardon','Harpa','Herdes','Herscovici','Hociung','Hodoreanu','Hostiuc','Huma','Hutanu','Huzum','Iacob','Iacobuta','Iancu','Ichim','Iftimesei','Ilie','Insuratelu','Ionesei','Ionesi','Ionita','Iordache','Iordache-tiroiu','Iordan','Iosub','Iovu','Irimia','Ivascu','Jecu','Jitariuc','Jitca','Joldescu','Juravle','Larion','Lates','Latu','Lazar','Leleu','Leon','Leonte','Leuciuc','Leustean','Luca','Lucaci','Lucasi','Luncasu','Lungeanu','Lungu','Lupascu','Lupu','Macariu','Macoveschi','Maftei','Maganu','Mangalagiu','Manolache','Manole','Marcu','Marinov','Martinas','Marton','Mataca','Matcovici','Matei','Maties','Matrana','Maxim','Mazareanu','Mazilu','Mazur','Melniciuc-puica','Micu','Mihaela','Mihai','Mihaila','Mihailescu','Mihalachi','Mihalcea','Mihociu','Milut','Minea','Minghel','Minuti','Miron','Mitan','Moisa','Moniry-abyaneh','Morarescu','Morosanu','Moscu','Motrescu','Motroi','Munteanu','Murarasu','Musca','Mutescu','Nastaca','Nechita','Neghina','Negrus','Negruser','Negrutu','Nemtoc','Netedu','Nica','Nicu','Oana','Olanuta','Olarasu','Olariu','Olaru','Onu','Opariuc','Oprea','Ostafe','Otrocol','Palihovici','Pantiru','Pantiruc','Paparuz','Pascaru','Patachi','Patras','Patriche','Perciun','Perju','Petcu','Pila','Pintilie','Piriu','Platon','Plugariu','Podaru','Poenariu','Pojar','Popa','Popescu','Popovici','Poputoaia','Postolache','Predoaia','Prisecaru','Procop','Prodan','Puiu','Purice','Rachieru','Razvan','Reut','Riscanu','Riza','Robu','Roman','Romanescu','Romaniuc','Rosca','Rusu','Samson','Sandu','Sandulache','Sava','Savescu','Schifirnet','Scortanu','Scurtu','Sfarghiu','Silitra','Simiganoschi','Simion','Simionescu','Simionesei','Simon','Sitaru','Sleghel','Sofian','Soficu','Sparhat','Spiridon','Stan','Stavarache','Stefan','Stefanita','Stingaciu','Stiufliuc','Stoian','Stoica','Stoleru','Stolniceanu','Stolnicu','Strainu','Strimtu','Suhani','Tabusca','Talif','Tanasa','Teclici','Teodorescu','Tesu','Tifrea','Timofte','Tincu','Tirpescu','Toader','Tofan','Toma','Toncu','Trifan','Tudosa','Tudose','Tuduri','Tuiu','Turcu','Ulinici','Unghianu','Ungureanu','Ursache','Ursachi','Urse','Ursu','Varlan','Varteniuc','Varvaroi','Vasilache','Vasiliu','Ventaniuc','Vicol','Vidru','Vinatoru','Vlad','Voaides','Vrabie','Vulpescu','Zamosteanu','Zazuleac');
  lista_prenume_fete varr := varr('Adina','Alexandra','Alina','Ana','Anca','Anda','Andra','Andreea','Andreia','Antonia','Bianca','Camelia','Claudia','Codrina','Cristina','Daniela','Daria','Delia','Denisa','Diana','Ecaterina','Elena','Eleonora','Elisa','Ema','Emanuela','Emma','Gabriela','Georgiana','Ileana','Ilona','Ioana','Iolanda','Irina','Iulia','Iuliana','Larisa','Laura','Loredana','Madalina','Malina','Manuela','Maria','Mihaela','Mirela','Monica','Oana','Paula','Petruta','Raluca','Sabina','Sanziana','Simina','Simona','Stefana','Stefania','Tamara','Teodora','Theodora','Vasilica','Xena');
  lista_prenume_baieti varr := varr('Adrian','Alex','Alexandru','Alin','Andreas','Andrei','Aurelian','Beniamin','Bogdan','Camil','Catalin','Cezar','Ciprian','Claudiu','Codrin','Constantin','Corneliu','Cosmin','Costel','Cristian','Damian','Dan','Daniel','Danut','Darius','Denise','Dimitrie','Dorian','Dorin','Dragos','Dumitru','Eduard','Elvis','Emil','Ervin','Eugen','Eusebiu','Fabian','Filip','Florian','Florin','Gabriel','George','Gheorghe','Giani','Giulio','Iaroslav','Ilie','Ioan','Ion','Ionel','Ionut','Iosif','Irinel','Iulian','Iustin','Laurentiu','Liviu','Lucian','Marian','Marius','Matei','Mihai','Mihail','Nicolae','Nicu','Nicusor','Octavian','Ovidiu','Paul','Petru','Petrut','Radu','Rares','Razvan','Richard','Robert','Roland','Rolland','Romanescu','Sabin','Samuel','Sebastian','Sergiu','Silviu','Stefan','Teodor','Teofil','Theodor','Tudor','Vadim','Valentin','Valeriu','Vasile','Victor','Vlad','Vladimir','Vladut');
      
  v_nume VARCHAR2(255);
  v_prenume VARCHAR2(255);
  v_no_of_cust INT;
  v_id_cust1 INT;
  v_id_cust2 INT;
  v_amount INT;
  v_date DATE;
  v_C1 DATE;
  v_C2 DATE;
  v_E DATE;
  v_X DATE;
  
  v_prefix VARCHAR2(4);
  v_final_card_no VARCHAR(16);
  v_Visa_Prefixes prefix_varr := prefix_varr('4539','4556','4916','4532','4929','4486','4716');
  v_Master_Prefixes prefix_varr := prefix_varr('2221','2222','2223','2224','2225','2226','2227','2228','2229');
 
  v_check_digit NUMBER(1);
  v_current NUMBER(2);
  v_card_no_rev VARCHAR(16);
  v_sum INT;
  v_pos INT;
  v_cvv VARCHAR(3);
  v_cvv_date DATE;
  v_exp_date DATE;
  v_count_same INT;
  v_created_at DATE;
  
  v_acc_no VARCHAR(24);
  v_balance DOUBLE PRECISION;
  v_acc_no_count INT;
  v_acc1 VARCHAR2(24);
  v_acc2 VARCHAR2(24);
  
  v_counter INT;
  v_has_pack int;
  v_no_of_pack INT;
  v_user_id INT;
  v_user_account VARCHAR2(24);
  v_opt_date DATE;
  v_opt_date2 DATE;
  v_pack INT;
  v_pack2 INT;
  
  FUNCTION gen_n_dig_num(p_n INT) RETURN VARCHAR2 is
 v_result VARCHAR2(16) := '';
begin
  for i in 1..p_n loop
    v_result := v_result || TRUNC(DBMS_RANDOM.VALUE(0,10));
  end loop;
  return v_result;
end gen_n_dig_num;
  
BEGIN





 DBMS_OUTPUT.PUT_LINE('Se genereaza oameni, carduri si conturi...');

-- POPULARE TABELA CUSTOMERS
FOR v_i IN 1..1025 LOOP
      
      v_nume := lista_nume(TRUNC(DBMS_RANDOM.VALUE(0,lista_nume.count))+1);
      IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
         v_prenume := lista_prenume_fete(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_fete.count))+1);
         
       ELSE
         v_prenume := lista_prenume_baieti(TRUNC(DBMS_RANDOM.VALUE(0,lista_prenume_baieti.count))+1);
               
       END IF;

                      
      v_date:= (sysdate-TRUNC(DBMS_RANDOM.VALUE(0,2500)));
      insert into customers values(v_i, v_nume, v_prenume, v_date, v_date);

 LOOP
    v_final_card_no := '';
    v_card_no_rev := '';

    IF (DBMS_RANDOM.VALUE(0,100)<50) THEN      
             v_prefix := v_Visa_Prefixes(TRUNC(DBMS_RANDOM.VALUE(0,v_Visa_Prefixes.count))+1);
            
           ELSE
             v_prefix := v_Master_Prefixes(TRUNC(DBMS_RANDOM.VALUE(0,v_Master_Prefixes.count))+1);
                  
    END IF;
    
    v_final_card_no := v_prefix;
    
    FOR v_i IN 1..11 LOOP        
        v_final_card_no := v_final_card_no || TRUNC(DBMS_RANDOM.VALUE(0,10));        
    END LOOP;
    
    for v_i in reverse 1..15 loop
      v_card_no_rev := v_card_no_rev || substr(v_final_card_no, v_i, 1);
    end loop;
    
    v_sum := 0;
    v_pos := 1;
    
    FOR v_i IN 1..8  LOOP
      v_current := TO_NUMBER( substr(v_card_no_rev, v_pos, 1) ) * 2;
      
      if v_current > 9 then      
        v_current := v_current - 9;
      end if;
      v_sum := v_sum + v_current;
      if v_pos != 15 then
        v_sum := v_sum + TO_NUMBER( substr(v_card_no_rev, v_pos + 1, 1) );
      end if;
      
      v_pos := v_pos + 2;
    END LOOP;

    
    v_check_digit := mod( ((TRUNC(v_sum/10) + 1) * 10 - v_sum) ,  10);
    v_final_card_no := v_final_card_no || v_check_digit;
    
    select count(card_number) into v_count_same from credit_cards where card_number = v_final_card_no;
    EXIT WHEN v_count_same = 0;
END LOOP;

    select add_months(created_at, 120), created_at into v_exp_date, v_created_at from customers where v_i = customers.id;
    --DBMS_OUTPUT.PUT_LINE('EXP DATE: ' || v_exp_date);
    
    
    v_cvv_date := v_exp_date + mod(to_number(v_final_card_no), 2500);
    --DBMS_OUTPUT.PUT_LINE('CVV DATE: ' ||v_cvv_date);
    v_cvv := mod(to_number(extract(day from v_cvv_date)) , 10) 
                   || mod( to_number(extract(month from v_cvv_date)) , 10) 
                   || mod(to_number(extract(year from v_cvv_date)) , 10);

    --DBMS_OUTPUT.PUT_LINE(v_final_card_no);
    --DBMS_OUTPUT.PUT_LINE(v_cvv);
    
    insert into credit_cards values(v_final_card_no, v_exp_date, v_cvv, v_created_at, v_created_at);
    
    --generam un account number
    LOOP
    v_acc_no := 'RO' || TRUNC(DBMS_RANDOM.VALUE(0,10)) || TRUNC(DBMS_RANDOM.VALUE(0,10)) || 'ANEO' || gen_n_dig_num(16) ;
    select count(account_number) into v_acc_no_count from accounts where account_number = v_acc_no;
    exit when v_acc_no_count = 0;
    END LOOP;
    --DBMS_OUTPUT.PUT_LINE(v_acc_no);
    v_balance := round(DBMS_RANDOM.VALUE(0,10000),2);
    
    insert into accounts values(v_acc_no, v_balance, v_created_at, v_created_at);
    
    insert into customer_credit_cards values(v_i, v_i, v_final_card_no, v_acc_no, v_created_at, v_created_at);
    
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se genereaza oameni, carduri si conturi...GATA!');

--select * from customers c join customer_credit_cards cc on c.id=cc.id_customer join credit_cards c3 on c3.card_number=cc.card_number join accounts a on a.account_number=cc.account_number where a.account_number like '%3736';






--POPULARE TABELA TRANSACTIONS si Transactions_History

select count(*) into v_no_of_cust from customers;
FOR v_i IN 1..1025 LOOP   
       LOOP
          v_id_cust1 :=  TRUNC(DBMS_RANDOM.VALUE(0,v_no_of_cust-1))+1;
          v_id_cust2 :=  TRUNC(DBMS_RANDOM.VALUE(0,v_no_of_cust-1))+1;
          EXIT WHEN v_id_cust1<>v_id_cust2;
       END LOOP;
       --DBMS_OUTPUT.PUT_LINE(v_id_cust1 || ' ' || v_id_cust2);
       DECLARE 
       BEGIN
          select account_number into v_acc1 from customer_credit_cards where id_customer = v_id_cust1;
          
          select account_number into v_acc2 from customer_credit_cards where id_customer = v_id_cust2;
          
          --DBMS_OUTPUT.PUT_LINE(v_temp1 || ' ' || v_temp2);
          v_amount := (TRUNC(DBMS_RANDOM.VALUE(50,10000)));
          
          select c1.created_at, c1.expire_date into v_C1, v_E 
          from credit_cards c1 join customer_credit_cards c2 on c1.card_number = c2.card_number 
          where c2.account_number = v_acc1;
          
          select c1.created_at into v_C2
          from credit_cards c1 join customer_credit_cards c2 on c1.card_number = c2.card_number 
          where c2.account_number = v_acc2;
          
          if v_C2 < v_E then
            if v_C1 < v_C2 then
              v_X := v_C2;
            else 
              v_X := v_C1;
            end if;
            
            v_date:= v_X + trunc(dbms_random.value(0,(v_E-v_X+1)));
                             
          
            insert into transactions values(v_i, v_acc1, v_acc2);
            insert into transactions_history values(v_i, v_amount, v_date, v_date );
          end if;
      
       END;
   END LOOP;


  insert into packs values(1,'Student',15,sysdate,sysdate);
  insert into packs values(2,'Salariat',25,sysdate,sysdate);
  insert into packs values(3,'Angel',15,sysdate,sysdate);
  insert into packs values(4,'Teo',20,sysdate,sysdate);
  
  
  v_counter := 1;
  FOR v_i in 1..1025 LOOP
  
    v_has_pack :=  TRUNC(DBMS_RANDOM.VALUE(0,100));
    if v_has_pack < 25 then
     v_no_of_pack :=  TRUNC(DBMS_RANDOM.VALUE(1,3));
     v_user_id :=  TRUNC(DBMS_RANDOM.VALUE(1,1026));
     select account_number into v_user_account from customer_credit_cards where id_customer = v_user_id;
     select created_at, created_at into v_opt_date, v_opt_date2 from accounts where account_number = v_user_account;
     
     if v_no_of_pack = 1 then
        v_pack :=  TRUNC(DBMS_RANDOM.VALUE(1,5));
        v_opt_date := v_opt_date + TRUNC(DBMS_RANDOM.VALUE(0,(sysdate-v_opt_date+1)));
        insert into options values(v_counter,v_user_account,v_pack,v_opt_date,v_opt_date);
        v_counter := v_counter + 1;
      else
        loop
          v_pack :=  TRUNC(DBMS_RANDOM.VALUE(1,5));
          v_pack2 :=  TRUNC(DBMS_RANDOM.VALUE(1,5));
          exit when v_pack <> v_pack2;
        end loop;
        v_opt_date := v_opt_date + TRUNC(DBMS_RANDOM.VALUE(0,(sysdate-v_opt_date+1)));
        insert into options values(v_counter,v_user_account,v_pack,v_opt_date,v_opt_date);
        v_counter := v_counter + 1;
        v_opt_date2 := v_opt_date2 + TRUNC(DBMS_RANDOM.VALUE(0,(sysdate-v_opt_date+1)));
        insert into options values(v_counter,v_user_account,v_pack2,v_opt_date2,v_opt_date2);
        v_counter := v_counter + 1;
      end if;
    
    end if;
    
  
  END LOOP;




END;




