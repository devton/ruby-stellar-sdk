require "stellar/convert"
require "stellar/dsl"

module Stellar
  class LedgerKey
    class << self
      def switch_for_arm(name)
        (@switch_by_arm ||= switches.invert).fetch(name)
      end

      def from(account_id:, **options)
        field, value = options.first
        case field
        when nil
          account(account_id: Stellar.KeyPair(account_id).account_id)
        when :balance_id
          claimable_balance(balance_id: ClaimableBalanceID.v0(Stellar::Convert.from_hex(value.to_s)))
        when :offer_id
          offer(seller_id: account_id, offer_id: Integer(value))
        when :data_name
          data(account_id: account_id, data_name: value.to_s)
        when :asset
          trust_line(account_id: account_id, asset: Stellar.Asset(value))
        else
          raise ArgumentError, "unknown option #{field} (not in :asset, :offer_id, :data_name, :balance_id)"
        end
      end
    end
  end
end
