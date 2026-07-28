import BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationPDE

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure LyapunovSchmidtReductionPackage {P : BifurcationPDEPackage} where
  projectionOntoKernel : Type
  bifurcationEquation : Prop
  reducedOperator : Prop
  nondegeneracyCondition : Prop

structure LyapunovSchmidtEvidence {P : BifurcationPDEPackage}
    (L : LyapunovSchmidtReductionPackage P) where
  bifurcationEquationClosed : L.bifurcationEquation
  reducedOperatorClosed : L.reducedOperator
  nondegeneracyConditionClosed : L.nondegeneracyCondition

def LyapunovSchmidtClosed {P : BifurcationPDEPackage}
    (L : LyapunovSchmidtReductionPackage P) : Prop :=
  L.bifurcationEquation ∧ L.reducedOperator ∧ L.nondegeneracyCondition

theorem lyapunov_schmidt_closed_from_evidence {P : BifurcationPDEPackage}
    (L : LyapunovSchmidtReductionPackage P) (E : LyapunovSchmidtEvidence L) :
    LyapunovSchmidtClosed L := by
  exact And.intro E.bifurcationEquationClosed
    (And.intro E.reducedOperatorClosed E.nondegeneracyConditionClosed)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse