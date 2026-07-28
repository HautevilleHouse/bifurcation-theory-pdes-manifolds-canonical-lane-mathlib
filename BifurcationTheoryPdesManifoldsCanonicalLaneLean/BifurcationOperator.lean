import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationOperatorPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  vectorField : Type v
  parameterSpace : Type w
  equilibriumFamily : parameterSpace → manifold → Prop
  linearizedOperator : parameterSpace → manifold → (Type x)
  pdeWellPosed : Prop
  smoothDependence : Prop

structure BifurcationOperatorEvidence (P : BifurcationOperatorPackage) where
  smoothStructureClosed : P.smoothStructure
  pdeWellPosedClosed : P.pdeWellPosed
  smoothDependenceClosed : P.smoothDependence

def BifurcationOperatorClosed (P : BifurcationOperatorPackage) : Prop :=
  P.smoothStructure ∧ P.pdeWellPosed ∧ P.smoothDependence

theorem bifurcation_operator_closed_from_evidence (P : BifurcationOperatorPackage)
    (E : BifurcationOperatorEvidence P) : BifurcationOperatorClosed P := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.pdeWellPosedClosed E.smoothDependenceClosed)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse