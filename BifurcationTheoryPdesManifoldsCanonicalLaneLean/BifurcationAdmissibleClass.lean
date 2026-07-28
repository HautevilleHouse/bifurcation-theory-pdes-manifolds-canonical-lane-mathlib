import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  parameterSpace : Type v
  parameterTopology : TopologicalSpace parameterSpace
  bifurcationEquation : Prop
  bifurcationPoint : space
  parameterValue : parameterSpace
  conclusion : Prop

structure AdmissibleClass where
  object : BifurcationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
