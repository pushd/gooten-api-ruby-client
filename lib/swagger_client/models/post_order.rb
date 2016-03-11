=begin


OpenAPI spec version: 1

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require 'date'

module SwaggerClient
  class PostOrder
    attr_accessor :ship_to_address

    attr_accessor :billing_address

    attr_accessor :items

    attr_accessor :payment

    # Clients can submit an ID they use for the order here.
    attr_accessor :source_id

    # Submit the order into PrePayment status.
    attr_accessor :is_pre_submit

    attr_accessor :coupon_code

    # An optional Map<string,string> of misc properties.
    attr_accessor :meta

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'ship_to_address' => :'ShipToAddress',
        
        :'billing_address' => :'BillingAddress',
        
        :'items' => :'Items',
        
        :'payment' => :'Payment',
        
        :'source_id' => :'SourceId',
        
        :'is_pre_submit' => :'IsPreSubmit',
        
        :'coupon_code' => :'CouponCode',
        
        :'meta' => :'Meta'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'ship_to_address' => :'ShipToAddress',
        :'billing_address' => :'ShipToAddress',
        :'items' => :'Array<PostOrderItem>',
        :'payment' => :'OrderPayment',
        :'source_id' => :'String',
        :'is_pre_submit' => :'BOOLEAN',
        :'coupon_code' => :'String',
        :'meta' => :'Meta'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'ShipToAddress']
        self.ship_to_address = attributes[:'ShipToAddress']
      end
      
      if attributes[:'BillingAddress']
        self.billing_address = attributes[:'BillingAddress']
      end
      
      if attributes[:'Items']
        if (value = attributes[:'Items']).is_a?(Array)
          self.items = value
        end
      end
      
      if attributes[:'Payment']
        self.payment = attributes[:'Payment']
      end
      
      if attributes[:'SourceId']
        self.source_id = attributes[:'SourceId']
      end
      
      if attributes[:'IsPreSubmit']
        self.is_pre_submit = attributes[:'IsPreSubmit']
      end
      
      if attributes[:'CouponCode']
        self.coupon_code = attributes[:'CouponCode']
      end
      
      if attributes[:'Meta']
        self.meta = attributes[:'Meta']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          ship_to_address == o.ship_to_address &&
          billing_address == o.billing_address &&
          items == o.items &&
          payment == o.payment &&
          source_id == o.source_id &&
          is_pre_submit == o.is_pre_submit &&
          coupon_code == o.coupon_code &&
          meta == o.meta
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [ship_to_address, billing_address, items, payment, source_id, is_pre_submit, coupon_code, meta].hash
    end

    # build the object from hash
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          else
            #TODO show warning in debug mode
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        else
          # data not found in attributes(hash), not an issue as the data can be optional
        end
      end

      self
    end

    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        _model = SwaggerClient.const_get(type).new
        _model.build_from_hash(value)
      end
    end

    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_body (backward compatibility))
    def to_body
      to_hash
    end

    # return the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Method to output non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end