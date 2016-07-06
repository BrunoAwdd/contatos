require 'csv'

class VcardController < ApplicationController
  def upload
  end

  def create
    csv_text = File.open(params[:vcard][:file].tempfile, "r:ISO-8859-1")
    contacts = []


    CSV.parse(csv_text, col_sep: ';', encoding: "r:ISO-8859-1") do |row|
      contacts.push({
          "first_name"    => row[0],
          "last_name"     => row[1],
          "display_name"  => row[2],
          "email"         => row[3],
          "email2"        => row[4],
          "home_fone"     => row[5],
          "business_fone" => row[6],
          "mobile_fone"   => row[7],
          "home_city"     => row[8],
          "home_state"    => row[9],
          "home_country"  => row[10],
          "notes"         => row[11],
          "web_page"      => row[12],
                    })
    end

    contacts.map {|contact| Contato.new(contact).save }
    #csv_text = CSV.read(params[:vcard][:file].tempfile)
    render plain: contacts
  end

  def createBkp
    #render plain: params[:vcard]
    vcard = Vpim::Vcard.decode(params[:vcard][:file].tempfile)
    contacts = []
    render plain: vcard.length

=begin
    for contact  in @vcard
      addresses = []
      emails = []
      telefones = []

      for address in contact.addresses
        @objAdress = Address.new({
            "country"      => address.country,
            "delivery"     => address.delivery,
            "extended"     => address.extended,
            "locality"     => address.locality,
            "location"     => address.location,
            "nonstandard"  => address.nonstandard,
            "pobox"        => address.pobox,
            "postalcode"   => address.postalcode,
            "preferred"    => address.preferred,
            "region"       => address.region,
            "street"       => address.street,
                                })
        addresses.push(@objAdress)
      end

      for email in contact.emails
        @objEmail = Email.new({
          "format"         => email.format,
          "location"       => email.location,
          "nonstandard"    => email.nonstandard,
          "preferred"      => email.preferred,
          "email"          => email.to_str,
        })
        emails.push(@objEmail)

      end

      for telefone in contact.telephones
        @objTelefone = Telefone.new({
          "capability"     => telefone.capability,
          "location"       => telefone.location,
          "nonstandard"    => telefone.nonstandard,
          "preferred"      => telefone.preferred,
          "telefone"       => telefone.to_str,
        })
        telefones.push(@objTelefone)
      end

      contacts.push(
          {
              "first_name" => cure(contact.name.given),
              "last_name" => cure(contact.name.family),
              "additional" => cure(contact.name.additional),
              "prefix" => contact.name.prefix,
              "suffix" => contact.name.suffix,
              "birthday" => contact.birthday,
              "org" => contact.org,
              "title" => contact.title,
              #"telefones" => telefones,
              #"emails" => emails,
              #"addresses" => addresses,
          }
      )


    end


    #contacts.map {|contact| Contato.new(contact).save }

    contacts.map {|contact| Contato.new(contact).save }

    respond_to do |format|
      if @contato.save
        format.html { render plain: 'Sucesso' }
        format.json { render 'Sucesso'  }
      else
        format.html { render plain: @contato.errors  }
        format.json { render json: @contato.errors, status: :unprocessable_entity }
      end
    end
=end




  end

  def toUtf (object)
    if object.class == "String"
      return cure(object)
    elsif object.class == "Array"
      #for str in object
        #cure(str)
      #end
      return object
    end

  end

  def cure(str)
    @str = str
    replacements = [ ['\xC3\xAD', 'í'], ['\xC3\xA7', 'ç'], ['\xC3\xA1', 'á'] ]
    replacements.each {|replacement|
      @str = @str.force_encoding("UTF-8")
      @str = @str.gsub(replacement[0], replacement[1])
    }
    return @str

  end

  def createtest


    @vcard = Vpim::Vcard.decode(params[:vcard][:file].tempfile)
    tel = {}
    debug = []
    a = 0

    for i  in @vcard
      tel[a] = {:telefones => i.telephones}

      if tel[a][:telefones].length > 1
        debug.push(a)
      end
      a= 1+a
    end
    render plain: tel[2][:telefones]

  end
end
