import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.BifurcationOperator
import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.CriticalityCondition
import HautevilleHouse.BifurcationTheoryPdesManifoldsCanonicalLaneLean.CenterManifold

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BifurcationOperatorClosed (A.object : BifurcationOperatorPackage) ∧
  CriticalityConditionClosed (A.object : CriticalityConditionPackage _) ∧
  CenterManifoldClosed (A.object : CenterManifoldPackage _ _)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedBifurcationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bifurcation_endgame (A : AdmissibleClass) :
    ConstrainedBifurcationClosure A := by
  have hBridge : bridgeClosed A := by
    -- This would need proper evidence from the object; here we assume it's given
    -- In a full formalization, we would extract the evidence from A.object
    sorry
  have hGate : gateClosed A := by
    exact A.gateWitness
  exact And.intro hBridge hGate

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse