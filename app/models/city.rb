class City < ActiveRecord::Base
  validates :elevation,
            numericality: {
              greater_than_or_equal_to: 3315,
              if: lambda { |city| city.state == 'CO'},
              message: 'is too low, the lowest elevation in Colorado is 3,315 feet'
            }
  validates :name, :population, :elevation, :state, presence: true
  validates :state, inclusion: {
    in: %w(AK
          AZ
          CT
          FL
          HI
          IL
          KY
          MD
          MN
          MT
          NE
          NM
          OH
          PA
          SC
          TX
          VI
          WI
          AL
          CA
          DC
          GA
          IA
          IN
          LA
          ME
          MO
          NC
          NH
          NV
          OK
          PR
          SD
          UT
          VT
          WV
          AR
          CO
          DE
          GU
          ID
          KS
          MA
          MI
          MS
          ND
          NJ
          NY
          OR
          RI
          TN
          VA
          WA
          WY),
    message: 'must be valid state abbreviation, format as two capital letters like CO for Colorado'
  }
  validates :population, numericality: {
    greater_than: 0
  }
end
