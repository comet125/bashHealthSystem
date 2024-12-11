##konstante -------------------------------------------------------------------------
ADMINUSER="admin"
ADMINPASS="admin"
user1NAM=('Mateo' 'Isaak' 'Marko' 'David' 'Toni' 'Josip' 'Marija')
user1SUR=('Marjanovic' 'Isakovic' 'Markovic' 'Davidovic' 'Tonic' 'Josipovic' 'Maric')
user2ADD=('Adresa 1' 'Adresa 2' 'Adresa 3' 'Adresa 4' 'Adrea 5' 'Adresa 6' 'Adresa 7')
user3JMBG=('3210987654321' '1234567890123' '2001000230056' '150400270079' '3007802220021' '2802002330160' '1505007180884')
user4ALS=('Alergija' 'Bol u srcu' 'Bol u nozi' 'Katarakta' 'Upala slijepog crijeva' 'Cystis Pinalis Non Compressivum' 'Hiperhidroza')
userPASS=('mateo123' 'isaak123' 'marko123' 'david123' 'toni123' 'josip123' 'marija123')
userMAX=6
odjeli=('Otorinolaringologija' 'Pedijatrija' 'Srce')
odjeliMAX=2
odjeliPAT=('3210987654321')
## ----------------------------------------------------------------------------------


function adminDashboard
{
    echo -e "\n---------------------------------"
    echo "Zdravo, $ADMINUSER"
    echo "Dobrodosli na upravljacku tablu"
    echo "---------------------------------"
    select OPTION in Kreiraj Uredi Izbrisi Lista Odjeli Postavke Izlaz
    do
        case $OPTION in
            Kreiraj)
                IDSET=0
                for ((i=0; i<=$userMAX; ++i))
                do
                  if [ -z ${user1NAM[$i]} ]
                  then
                    IDSET=$i
                    break
                  else
                    if [ $i == $userMAX ]
                    then
                      ((userMAX++));
                      IDSET=$userMAX
                    fi
                  fi
                done
                echo -e "\nKreiranje korisnika"
                echo "---------------------------------"
                echo -e "IME KORISNIKA:\c"
                read user1NAM[$IDSET]
                echo -e "PREZIME KORISNIKA:\c"
                read user1SUR[$IDSET]
                echo -e "ADRESA KORISNIKA:\c"
                read user2ADD[$IDSET]
                echo -e "JMBG KORISNIKA:\c"
                read user3JMBG[$IDSET]
                echo -e "ANALIZA KORISNIKA:\c"
                read user4ALS[$IDSET]
                echo -e "PASSWORD KORISNIKA:\c"
                read userPASS[$IDSET]
                echo "---------------------------------"
                echo "Unesite opciju sa glavnog menija:"
                ;;
            Uredi)
                echo -e "Uredjivanje korisnika \n---------------------------------"
                echo "Unesite JMBG korisnika"
                read DESIREDNO
                for ((i=0; i<=$userMAX; ++i))
                do
                  if [ $DESIREDNO == ${user3JMBG[$i]} ]
                  then
                    echo -e "Uredjivanje korisnika ${user1NAM[$i]} ${user1SUR[$i]}"
                    echo "---------------------------------"
                    echo -e "IME KORISNIKA:\c"
                    read user1NAM[$i]
                    echo -e "PREZIME KORISNIKA:\c"
                    read user1SUR[$i]
                    echo -e "ADRESA KORISNIKA:\c"
                    read user2ADD[$i]
                    echo -e "JMBG KORISNIKA:\c"
                    read user3JMBG[$i]
                    echo -e "ANALIZA KORISNIKA:\c"
                    read user4ALS[$i]
                    echo -e "PASSWORD KORISNIKA:\c"
                    read userPASS[$i]
                    echo "---------------------------------"
                    echo "Unesite opciju sa glavnog menija:"
                    break
                  else
                    if [ $i == $userMAX ]
                    then
                      echo "Korisnik nije pronadjen"
                      echo "---------------------------------"
                      echo "Unesite opciju sa glavnog menija:"
                    fi
                  fi
                done
                ;;
            Izbrisi)
                echo -e "Brisanje korisnika \n---------------------------------"
                echo "Unesite JMBG korisnika za brisanje"
                read DESIREDNO
                for ((i=0; i<=$userMAX; ++i))
                do
                  if [ $DESIREDNO == ${user3JMBG[$i]} ]
                  then
                    echo "Jeste li sigurni da zelite izbrisati korisnika ${user1NAM[$i]} ${user1SUR[$i]}?"
                    echo "(1) za DA, (2) za NE"
                    while true
                    do
                      read ERASECHOICE
                      if [ $ERASECHOICE == 1 ]
                      then
                        unset -v user1NAM[$i]
                        unset -v user1SUR[$i]
                        unset -v user2ADD[$i]
                        unset -v user3JMBG[$i]
                        unset -v user4ALS[$i]
                        unset -v userPASS[$i]
                        echo "Korisnik je uspjesno izbrisan."
                        echo "---------------------------------"
                        echo "Unesite opciju sa glavnog menija:"
                        break
                      elif [ $ERASECHOICE == 2 ]
                      then
                        adminDashboard
                        break
                      else
                        echo "Nepoznat unos, pokusajte ponovo:"
                      fi
                    done
                    break
                  else
                    if [ $i == $userMAX ]
                    then
                      echo "Korisnik nije pronadjen"
                      echo "---------------------------------"
                      echo "Unesite opciju sa glavnog menija:"
                    fi
                  fi
                done
                ;;
            Lista)
                echo -e "\nLISTA SVIH KORISNIKA"
                echo "---------------------------------"
                for ((i=0; i<$(expr "$userMAX" + 1); ++i))
                do
                  if [ -z ${user1NAM[$i]} ]
                  then
                    continue
                  else
                    echo "ID: $(expr "$i" + 1)"
                    echo "Ime: ${user1NAM[$i]}"
                    echo "Prezime: ${user1SUR[$i]}"
                    echo "Adresa: ${user2ADD[$i]}"
                    echo "JMBG: ${user3JMBG[$i]}"
                    echo "Dijagnoza: ${user4ALS[$i]}"
                    echo "---------------------------------"
                  fi
                done
                  echo "Unesite opciju sa glavnog menija:"
                ;;
            Odjeli)
                  echo "---------------------------------"
                  echo "Sekcija Odjela"
                  echo "(1) za KREIRANJE, (2) za PRIJAVLJENE PACIJENTE, (3) za NAZAD"
                  while true
                  do
                    read SCHOICE
                    if [ $SCHOICE == 1 ]
                    then
                      ((odjeliMAX++));
                      echo "Unesite ime novog odjela:"
                      read odjeli[$odjeliMAX]
                      echo "---------------------------------"
                      echo "Unesite opciju sa glavnog menija:"
                      break
                    elif [ $SCHOICE == 2 ]
                    then
                      increment=0
                      for i in ${odjeli[@]}
                      do
                        echo -e "\n$i"
                        for ((j=$increment; j<$(expr "$increment" + 5); j++))
                        do
                          for ((k=0; k<=$userMAX; ++k))
                          do
                            if [[ ${odjeliPAT[$j]} == ${user3JMBG[$k]} ]]
                            then
                              echo "${user1NAM[$k]} ${user1SUR[$k]}"
                            elif [ $k == $userMAX ]
                            then
                              continue
                            fi
                          done
                        done
                      ((increment+=5));
                      done
                    echo "---------------------------------"
                    echo "(1) za KREIRANJE, (2) za PRIJAVLJENE PACIJENTE, (3) za NAZAD"
                    elif [ $SCHOICE == 3 ]
                    then
                      adminDashboard
                      break
                    else
                      echo "Nepoznat unos, pokusajte ponovo:"
                    fi
                done
                
                ;;
            Postavke)
                echo "Postavke za nalog $ADMINUSER"
                echo "---------------------------------"
                select POSTAVKE in Username Sifra Nazad
                do
                    case $POSTAVKE in
                        Username)
                            echo "Unesite novo ime za nalog administratora"
                            read ADMINUSER
                            echo "Upisite 3 za povratak na glavni meni"
                            ;;
                        Sifra)
                            echo "Unesite novu sifru za nalog adminstratora"
                            read ADMINPASS
                            echo "Upisite 3 za povratak na glavni meni"
                            ;;
                        Nazad)
                            adminDashboard
                            ;;
                        *)
                            echo "Nepoznat unos, pokusajte ponovo"
                            ;;
                    esac
                done
                ;;
            Izlaz)
                echo "Odaberite Odjavu iz naloga $ADMINUSER ili Izlaz iz programa"
                echo "---------------------------------"
                select IZLAZ in Odjava Izlaz
                do
                    case $IZLAZ in
                        Odjava)
                            echo "Odjava uspjesna"
                            echo "---------------------------------"
                            login
                            ;;
                        Izlaz)
                            echo "Izlaz uspjesan"
                            echo "---------------------------------"
                            exit 1
                            ;;
                        *)
                            echo "Nepoznat izbor $IZLAZ"
                            ;;
                    esac
                done
                ;;
            *)
                echo "Nepoznat izbor $OPTION"
                ;;
        esac
    done
}

function userDashboard
{
  echo -e "\n---------------------------------"
  echo "Zdravo, ${user1NAM[$1]}"
  echo "Dobrodosli na sistem zdravstva"
  echo "---------------------------------"
  select KORISNIK in Karton Prijem Kapaciteti Izlaz
  do
    case $KORISNIK in
      Karton)
        echo -e "\n---------------------------------"
        echo "VAS KARTON"
        echo "---------------------------------"
        echo "Ime: ${user1NAM[$1]}"
        echo "Prezime: ${user1SUR[$1]}"
        echo "Vasa Adresa: ${user2ADD[$1]}"
        echo "JMBG: ${user3JMBG[$1]}"
        echo "Dijagnoza: ${user4ALS[$1]}"
        echo "---------------------------------"
        echo "Unesite opciju sa glavnog menija:"
        ;;
      Prijem)
        echo "Prijem za odjele"
        echo "---------------------------------"
        echo -e "Trenutno dostupni odjeli su:\n"
        enum=0
        for i in ${odjeli[@]}
        do
          echo "$enum) $i"
          ((enum++));
        done
        echo -e "\nUnesite broj kraj odjela na koji se zelite prijaviti"
        while true
        do
          read SEC_CHOICE
          if [ $SEC_CHOICE -gt $odjeliMAX ]
          then
            echo "Odjel koji ste unijeli trenutno ne postoji, pokusajte ponovo:"
          else
            LOGIC_CHOICE=$((SEC_CHOICE * 5))
            for ((i=$LOGIC_CHOICE; i<$((LOGIC_CHOICE + 5)); i++))
            do
              if [[ ${user3JMBG[$1]} == ${odjeliPAT[$LOGIC_CHOICE]} ]]
              then
                echo "Vec ste se prijavili na ovaj odjel!"
                echo -e "Povratak na glavni meni...\n---------------------------------"
                break
              elif [ -z ${odjeliPAT[$i]} ]
              tempJMBG=${user3JMBG[$1]}
              then
                odjeliPAT[$LOGIC_CHOICE]=$tempJMBG
                echo "Mjesto pronadjeno! Vasa prijava na odjel je potvrdjena."
                echo -e "Povratak na glavni meni...\n---------------------------------"
                break
              else
                if [ $i == $((LOGIC_CHOICE + 4)) ]
                then
                echo "Na odjelu trenutno nema slobodnih mjesta, pokusajte ponovo kasnije"
                echo -e "Povratak na glavni meni...\n---------------------------------"
                fi
              fi
            done
            break
          fi
        done
        ;;
      Kapaciteti)
        increment=0
        for i in ${odjeli[@]}
        do
          echo -e "\n$i"
          for ((j=$increment; j<$(($increment + 5)); j++))
          do
            for ((k=0; k<=$userMAX; ++k))
            do
              if [[ ${odjeliPAT[$j]} == ${user3JMBG[$k]} ]]
               then
                  echo -e "-\c"
                  if [[ ${user3JMBG[$k]} == ${user3JMBG[$1]} ]]
                  then
                    echo "(${user1NAM[$1]} ${user1SUR[$1]})"
                  fi
              elif [ $k == $userMAX ]
              then
                 continue
              fi
             done
          done
        ((increment=$increment+5));
        done
        echo "---------------------------------"
        echo "Unesite opciju sa glavnoga menija:"
        ;;
      Izlaz)
        echo "Odaberite Odjavu iz naloga ili izlaz iz programa"
        echo "---------------------------------"
        select IZLAZ in Odjava Izlaz
        do
          case $IZLAZ in
            Odjava)
              echo "Odjava uspjesna"
              echo "---------------------------------"
              login
              ;;
            Izlaz)
              echo "Izlaz uspjesan"
              echo "---------------------------------"
              exit 1
              ;;
            *)
              echo "Nepoznat izbor $IZLAZ"
              ;;
            esac
        done
        ;;
      *)
        echo "Nepoznat izbor $KORISNIK"
        ;;
    esac
  done
}

function login
{
    echo "Dobrodosli u Sistem Zdravstva TK"
    echo "Molimo upisite vase podatke:"
    echo "---------------------------------"
    while true
    do
        echo -e "IME: \c"
        read USERNAME
        echo -e "PREZIME: \c"
        read SURNAME
        echo -e "SIFRA: \c"
        read PASSWORD
        if [ $USERNAME == $ADMINUSER ] && [ $PASSWORD == $ADMINPASS ]
        then
            echo "Admin rezim ukljucen"
            adminDashboard
            break
        else
          for (( i=0; i <= $userMAX; ++i ))
          do
            if [ $USERNAME == ${user1NAM[$i]} ]
            then
              if [ $SURNAME == ${user1SUR[$i]} ]
              then
                if [ $PASSWORD == ${userPASS[$i]} ]
                then
                  echo "Validacija uspjesna"
                  userDashboard "$i"
                  break
                else
                  echo "Nalog pronadjen, netacna sifra"
                  echo "Pokusajte ponovo"
                  echo "---------------------------------"
                  break
                fi
              fi
            else
              if [ $i == $userMAX ]
              then
                echo -e "\nIme i Prezime koje ste unijeli nije vezano sa nalogom"
                echo "Pokusajte se prijaviti ponovo"
                echo "---------------------------------"
              fi
            fi
          done
        fi   
    done
}

login
