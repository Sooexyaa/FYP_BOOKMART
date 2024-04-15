<?php

namespace App\Http\Middleware;

use Illuminate\Http\Middleware\TrustHosts as Middleware;

class TrustHosts extends Middleware
{
    /**
     * Get the host patterns that should be trusted.
     *
<<<<<<< HEAD
     * @return array
     */
    public function hosts()
=======
     * @return array<int, string|null>
     */
    public function hosts(): array
>>>>>>> 31f69df9cad6e8a7c11e79d2c8b6f0936703fabc
    {
        return [
            $this->allSubdomainsOfApplicationUrl(),
        ];
    }
}
