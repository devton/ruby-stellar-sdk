module Stellar
  class FeeBumpTransaction
    include Stellar::Concerns::Transaction

    def to_envelope(*key_pairs)
      signatures = (key_pairs || []).map(&method(:sign_decorated))

      TransactionEnvelope.fee_bump(signatures: signatures, tx: self)
    end

    def signature_base_prefix
      val = Stellar::EnvelopeType.envelope_type_tx_fee_bump

      Stellar.current_network_id + Stellar::EnvelopeType.to_xdr(val)
    end

    def source_account
      source_account_ed25519
    end
  end
end
