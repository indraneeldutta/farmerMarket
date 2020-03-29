require 'rspec'
require_relative '../lib/farmer_market'

describe Checkout do
  let(:checkout) { Checkout.new }
  let(:checkout_with_coffee_rule) { Checkout.new('BOGO')}
  let(:checkout_with_rules) { Checkout.new('BOGO', 'APPL')}

    context 'all rules' do
        let(:checkout_with_apple_rule) { Checkout.new('APPL')}
        let(:checkout_with_chai_rule) { Checkout.new('CHMK')}
        let(:checkout_with_oatmeal_rule) { Checkout.new('APOM')}


        it 'should appropriately calculate buy one get one free coffee' do
            2.times do
                checkout_with_coffee_rule.scan('CF1')
            end
            expect(checkout_with_coffee_rule.total).to eq("$11.23")
        end

        it 'should appropriately calculate buying 2 apple bags' do
            2.times do
                checkout_with_apple_rule.scan('AP1')
            end
            expect(checkout_with_apple_rule.total).to eq("$12.0")
        end

        it 'should appropriately calculate buying 3 apple bags' do
            3.times do
                checkout_with_apple_rule.scan('AP1')
            end
            expect(checkout_with_apple_rule.total).to eq("$13.5")
        end

        it 'should appropriately calculate buying 5 apple bags' do
            5.times do
                checkout_with_apple_rule.scan('AP1')
            end
            expect(checkout_with_apple_rule.total).to eq("$22.5")
        end

        it "should appropriately calculate buying two chais and one milk" do
            2.times do
                checkout_with_chai_rule.scan('CH1')
            end
            checkout_with_chai_rule.scan('MK1')
            expect(checkout_with_chai_rule.total).to eq("$6.22")
        end


        it "should appropriately calculate buying two chais and two milks" do
            2.times do
                checkout_with_chai_rule.scan('CH1')
                checkout_with_chai_rule.scan('MK1')
            end
            expect(checkout_with_chai_rule.total).to eq("$10.97")
        end

        it "should appropriately calculate buying two chais and no milk" do
            2.times do
                checkout_with_chai_rule.scan('CH1')
            end
            expect(checkout_with_chai_rule.total).to eq("$6.22")
        end

        it "should appropriately calculate buying one oatmeal and one apple" do
            1.times do
                checkout_with_oatmeal_rule.scan('OM1')
                checkout_with_oatmeal_rule.scan('AP1')
            end
            expect(checkout_with_oatmeal_rule.total).to eq("$6.69")
        end


    end

end