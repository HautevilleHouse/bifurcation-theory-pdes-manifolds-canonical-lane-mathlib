import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationAdmittedObject where
  manifoldType : Type u
  manifoldTopology : TopologicalSpace manifoldType
  pdeOperator : (manifoldType → ℝ) → (manifoldType → ℝ)
  parameterSpace : Type v
  bifurcationPoint : parameterSpace
  linearizedOperator : (manifoldType → ℝ) → (manifoldType → ℝ)
  fredholmIndex : ℤ
  kernelDimension : ℕ
  conclusion : Prop

structure AdmissibleClass where
  object : BifurcationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BifurcationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse